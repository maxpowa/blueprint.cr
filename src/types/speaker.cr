module Blueprint
  class SpeakerParameters
    JSON.mapping(
      playback_volume: Float64,
      playback_globally: Bool,
      allow_polyphony: Bool,
    )

    def initialize(@playback_volume, @playback_globally, @allow_polyphony)
    end
  end

  class SpeakerAlertParameters
    JSON.mapping(
      show_alert: Bool,
      show_on_map: Bool,
      icon_signal_id: SignalId,
      alert_message: String,
    )

    def initialize(@show_alert, @show_on_map, @icon_signal_id, @alert_message)
    end
  end
end
