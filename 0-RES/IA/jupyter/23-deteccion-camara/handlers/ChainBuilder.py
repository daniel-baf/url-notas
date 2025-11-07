from tkinter.filedialog import Open
from handlers.subhandlers.NoFingersHandler import CloseHandHandler, FistHandler
from handlers.subhandlers.OneFingerHandler import PointHandler, LikeHandler
from handlers.subhandlers.TwoFingersHandler import (
    VictoryHandler,
    RockHandler,
    LoveHandler,
    CallMeHandler,
    PinchHandler,
    OkHandler,
    CoreanHeartHandler,
)
from handlers.subhandlers.HandHandler import (
    OpenHandHandler,
    StopHandler,
    VulcanoHandler,
)


def get_chain_handlers():
    """
    Returns a list of gesture handlers in a chain.
    """

    handler_chain = CloseHandHandler()
    handler_chain.set_next(FistHandler()).set_next(PointHandler()).set_next(
        LikeHandler()
    ).set_next(VictoryHandler()).set_next(CoreanHeartHandler()).set_next(
        RockHandler()
    ).set_next(LoveHandler()).set_next(CallMeHandler()).set_next(
        PinchHandler()
    ).set_next(OkHandler()).set_next(OpenHandHandler()).set_next(StopHandler())

    return handler_chain
