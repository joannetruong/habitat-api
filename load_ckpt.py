import torch
path = "/private/home/jtruong/repos/habitat-api-v2/data/checkpoints/ddppo_gibson_no_noise_0.30/ckpt.47.8.317802024968053.pth"
device = (
        torch.device("cuda:{}".format(0))
        if torch.cuda.is_available()
        else torch.device("cpu")
    )
saved_model = torch.load(path, map_location=device)
for k, v in saved_model["state_dict"].items():
    print(k)
    if k == "actor_critic.net.visual_encoder.compression.0.weight":
        print(v.shape)
    if k == "actor_critic.net.visual_encoder.compression.1.weight":
        print(v.shape)
    if k == "actor_critic.net.visual_encoder.compression.1.bias":
        print(v.shape)
    if k == "actor_critic.net.visual_fc.1.weight":
        print(v.shape)
save_path = "/private/home/jtruong/repos/iGibson/models/ckpt.47.8.317802024968053.pth"
torch.save(saved_model["state_dict"], save_path)
