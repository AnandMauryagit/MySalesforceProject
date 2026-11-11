trigger AccouCustomMetaDataUse on Account (before update) {
AccouCustomMetaDataUse.getRecord(trigger.new);
}