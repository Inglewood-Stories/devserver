cfg = {
    License = "VUXFSU5Y6G41ZTO",
    BlacklistedKeywords = {

    },
}

function Notification(output)
    TriggerEvent('dlrms_notify', 'info', output)
end