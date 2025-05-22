import os
import json

from django.conf import settings
from collections import deque  # Para manejar las últimas 20 predicciones
from django.http import JsonResponse
from django.shortcuts import render
from collections import Counter
from django.shortcuts import redirect

recent_predictions = deque(maxlen=20)

class_mapping_path = os.path.join(
    settings.BASE_DIR, "iot_api", "model", "class_mapping.json"
)

# Cargar el archivo JSON de mapeo de clases
class_mapping = json.load(open(class_mapping_path))


def _get_predictions_list(recent_predictions):
    return [p["prediction"] for p in recent_predictions]


def _get_count_by_class(predictions):
    return Counter(predictions)


def _get_most_common_prediction(count_by_class):
    most_common = count_by_class.most_common(1)
    return most_common[0][0] if most_common else None


def _get_class_percentages(count_by_class):
    counts = list(count_by_class.values())
    total = sum(counts)
    return [round((count / total) * 100, 2) for count in counts] if total > 0 else []


def toggle_notification(request):
    if request.method == "GET":
        try:
            label = request.GET.get("class_name")
            if not label:
                return JsonResponse(
                    {"error": "class_name parameter is required"}, status=400
                )

            # Check if the label exists in class_mapping
            if label in class_mapping:
                # Toggle the display status
                class_mapping[label]["display"] = not class_mapping[label].get(
                    "display", False
                )

                # Save changes to the JSON file
                with open(class_mapping_path, "w") as f:
                    json.dump(class_mapping, f, indent=4)

                return redirect(
                    f"{request.scheme}://{request.get_host()}/api/dashboard/"
                )
            else:
                return JsonResponse({"error": "Label not found"}, status=404)

        except Exception as e:
            return JsonResponse({"error": str(e)}, status=500)


def dashboard(request):
    """
    Renders the dashboard view with prediction statistics.

    Args:
        request (HttpRequest): The HTTP request object.

    Returns:
        HttpResponse: The rendered dashboard page with context data including:
            - recent_predictions (list): List of recent prediction records.
            - class_labels (list): List of unique class labels.
            - class_percentages (dict): Percentage distribution of each class.
            - most_common_prediction (str): The most frequently predicted class.
            - last_detection_time (datetime or None): Timestamp of the last prediction, or None if no predictions exist.
    """
    predictions = _get_predictions_list(recent_predictions)
    count_by_class = _get_count_by_class(predictions)
    most_common_prediction = _get_most_common_prediction(count_by_class)
    labels = list(count_by_class.keys())
    percentages = _get_class_percentages(count_by_class)

    context = {
        "recent_predictions": list(recent_predictions) if len(recent_predictions) > 0 else None,
        "class_labels": labels if len(labels) > 0 else None,
        "class_percentages": percentages if len(percentages) > 0 else None,
        "most_common_prediction": most_common_prediction if most_common_prediction else None,
        "class_mapping": class_mapping if class_mapping else None,
        "last_detection_time": recent_predictions[-1]["time"] if len(recent_predictions) > 0 else None,
        "api_toggle_uri": f"{request.scheme}://{request.get_host()}/api/dashboard/toggle_notification",
    }
    return render(request, "dashboard.html", context)
