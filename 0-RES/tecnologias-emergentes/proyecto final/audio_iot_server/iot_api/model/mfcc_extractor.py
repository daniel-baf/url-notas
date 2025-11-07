import numpy as np
import librosa


def extract_mfcc(audio_file_path, num_mfcc=13, max_padding_length=174, sr=22050):
    """
    Extracts MFCCs with delta and delta-delta features.
    Returns array of shape (39, max_padding_length) ready for CNN input.
    """
    # 1. Load audio with fixed sample rate
    audio_signal, _ = librosa.load(audio_file_path, sr=sr)

    # 2. Extract base MFCCs
    mfcc_features = librosa.feature.mfcc(
        y=audio_signal,
        sr=sr,
        n_mfcc=num_mfcc,
        n_fft=min(2048, len(audio_signal)),
        hop_length=512,
        fmax=sr / 2,
    )

    # 3. Normalize per coefficient
    mfcc_features = librosa.util.normalize(mfcc_features)

    # 4. Pad/truncate to fixed length
    if mfcc_features.shape[1] < max_padding_length:
        mfcc_features = np.pad(
            mfcc_features,
            ((0, 0), (0, max_padding_length - mfcc_features.shape[1])),
            mode="constant",
        )
    else:
        mfcc_features = mfcc_features[:, :max_padding_length]

    # 5. Add delta features
    delta_mfcc = librosa.feature.delta(mfcc_features)
    delta2_mfcc = librosa.feature.delta(mfcc_features, order=2)

    # Stack features vertically (39, 174)
    return np.vstack([mfcc_features, delta_mfcc, delta2_mfcc])
