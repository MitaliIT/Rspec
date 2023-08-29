ActiveRecord::Base.transaction do
    product = Product.create(
      name: "Laptop",
      description: "A laptop is a portable computer designed to be used on the go. It usually features a clamshell design with a keyboard and a display screen attached to the top part",
      price: "100",
      quantity: "10"
    )
    product = Product.create(
      name: "Bottle",
      description: "",
      price: "100",
      quantity: "5"
    )
    product = Product.create(
      name: "Mobile",
      description: "A smartphone is a handheld electronic device that combines the functionalities of a mobile phone with those of a computer. It typically features a touchscreen interface",
      price: "200",
      quantity: "10"
    )
    product = Product.create(
      name: "Charger",
      description: "The charger controls the flow of electrical current and voltage to prevent overcharging, which can damage the battery, and to ensure efficient and safe charging.",
      price: "200",
      quantity: "5"
    )
    product = Product.create(
      name: "Switch",
      description: "In the context of computer networking, a switch is a networking device that operates at the data link layer (Layer 2) of the OSI model.",
      price: "300",
      quantity: "20"
    )
    product = Product.create(
      name: "Headphone",
      description: " They provide a private and immersive listening experience by delivering sound directly into the ears",
      price: "150",
      quantity: "20"
    )
end
