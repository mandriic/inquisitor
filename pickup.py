# import libpcap as pcap
# pcap.config(LIBPCAP="tcpdump")  # included tcpdump library will be used

# # libpcap.pcap.from_address()
# pcap_handle = pcap.pcap(timeout_ms=0)
# print (pcap_handle.in_dll)
# # print(dir(libpcap))

from pylibpcap.pcap import sniff, rpcap

def sniffing():
    for plen, t, buf in sniff("eth0", filters="port 21", count=-1, promisc=1, out_file="pcap.pcap"):
        print("[+]: Payload len=", plen)
        print("[+]: Time", t)
        print("[+]: Payload", buf)

def read():
    for len, t, pkt in rpcap("pcap.pcap"):
        print("Buf length:", len)
        print("Time:", t)
        print("Buf:", pkt)

sniffing()