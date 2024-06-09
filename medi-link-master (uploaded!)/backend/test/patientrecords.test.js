it("should store and retrieve patient records correctly", async function () {
  const instance = await PatientRecords.deployed();
  await instance.setPatientRecord(1, "John Doe", "1990-01-01", "Healthy");

  const result = await instance.getPatientRecord(1);
  assert.equal(result[0], "John Doe", "The name should be 'John Doe'");
});
