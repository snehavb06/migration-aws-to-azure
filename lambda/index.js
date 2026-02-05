exports.handler = async (event) => {
  console.log("Event received:", JSON.stringify(event));

  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      message: "Hello sneha here. Its assessment for me to migrate aws to azure"
    })
  };
};