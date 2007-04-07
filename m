Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l37H2P1Z016716
	for <linux-lvm@redhat.com>; Sat, 7 Apr 2007 13:02:25 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.250])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l37H2MnE018113
	for <linux-lvm@redhat.com>; Sat, 7 Apr 2007 13:02:22 -0400
Received: by an-out-0708.google.com with SMTP id d18so1746718and
	for <linux-lvm@redhat.com>; Sat, 07 Apr 2007 10:02:22 -0700 (PDT)
Message-ID: <3120c9e30704071002p184e6676ieddfa0cc6b1e6645@mail.gmail.com>
Date: Sat, 7 Apr 2007 22:32:21 +0530
From: "Anuj Singh" <anujhere@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] piranha on Fedora core 6, piranha-gui fails,
	pulse running_real servers not switching
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi ,
I am configuring lvs nat router with piranha-0.7.12-1 on Fedora Core 6 machines
When i turn off service of one of my real service it is not switching
to second real server. I can access and see logs of connection in
ipvsadm -L.
I edited sample.cf file and copied as lvs.cf. as my piranha-gui is not
running due to some missing appache modules.

Director Master lvs machine
eth0=10.1.1.1
eth1=192.168.10.42

routing table without running pulse service
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.10.0    0.0.0.0         255.255.255.0   U     0      0        0 eth1
10.1.1.0        0.0.0.0         255.255.255.0   U     0      0        0 eth0
169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0 eth1

routing table after starting pulse service
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.10.0    0.0.0.0         255.255.255.0   U     0      0        0 eth1
10.1.1.0        0.0.0.0         255.255.255.0   U     0      0        0 eth0
169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0 eth1
10.0.0.0        0.0.0.0         255.0.0.0       U     0      0        0 eth0

ipvsadm -L
IP Virtual Server version 1.2.1 (size=4096)
Prot LocalAddress:Port Scheduler Flags
 -> RemoteAddress:Port           Forward Weight ActiveConn InActConn
TCP  10.1.1.22:ftp wlc
TCP  10.1.1.21:http rr persistent 60
 -> node31.prolog.com:http Masq    2      0          0


Slave backupp lvs machine
eth0=10.1.12
eth1=192.168.10.55

Test client machine IP = 10.1.1.11

my lvs.cf

service = lvs
primary = 192.168.10.42
backup = 192.168.10.55
backup_active = 1
heartbeat = 1
heartbeat_port = 1050
keepalive = 6
deadtime = 18
network = nat
nat_router = 192.168.10.111 eth1:1
virtual server1 {
   address = 10.1.1.21 eth0:1
   active = 1
   load_monitor = uptime
   timeout = 5
   reentry = 10
   port = http
       send = "GET / HTTP/1.0\r\n\r\n"
       expect = "HTTP"
   scheduler = rr
   persistent = 60
   pmask = 255.255.255.255
       protocol = tcp
   server Real1 {
       address = 192.168.10.31
       active = 1
       weight = 2
   }
   server Real2 {
       address = 192.168.10.83
       active = 1
       weight = 1
   }
}
virtual server2 {
   address = 10.1.1.22 eth0:2
   active = 1
   load_monitor = uptime
   timeout = 5
   reentry = 10
   port = 21
       send = "\n"
   server Real1 {
       address = 192.168.10.83
       active = 1
   }
   server Real2 {
       address = 192.168.10.3
       active = 1
   }
}


Logs:
Apr  7 21:50:45 pr0032 pulse[7695]: STARTING PULSE AS MASTER
Apr  7 21:51:03 pr0032 pulse[7695]: partner dead: activating lvs
Apr  7 21:51:03 pr0032 lvs[7697]: starting virtual service server1 active: 80
Apr  7 21:51:03 pr0032 nanny[7703]: starting LVS client monitor for 10.1.1.21:80
Apr  7 21:51:03 pr0032 lvs[7697]: create_monitor for server1/Real1
running as pid 7703
Apr  7 21:51:03 pr0032 nanny[7704]: starting LVS client monitor for 10.1.1.21:80
Apr  7 21:51:03 pr0032 lvs[7697]: create_monitor for server1/Real2
running as pid 7704
Apr  7 21:51:03 pr0032 lvs[7697]: starting virtual service server2 active: 21
Apr  7 21:51:03 pr0032 nanny[7706]: starting LVS client monitor for 10.1.1.22:21
Apr  7 21:51:03 pr0032 lvs[7697]: create_monitor for server2/Real1
running as pid 7706
Apr  7 21:51:03 pr0032 nanny[7707]: starting LVS client monitor for 10.1.1.22:21
Apr  7 21:51:03 pr0032 lvs[7697]: create_monitor for server2/Real2
running as pid 7707
Apr  7 21:51:03 pr0032 avahi-daemon[4317]: Registering new address
record for 10.1.1.21 on eth0.
Apr  7 21:51:03 pr0032 avahi-daemon[4317]: Registering new address
record for 10.1.1.22 on eth0.
Apr  7 21:51:03 pr0032 nanny[7703]: making 192.168.10.31:80 available
Apr  7 21:51:03 pr0032 avahi-daemon[4317]: Registering new address
record for 192.168.10.111 on eth1.
Apr  7 21:51:08 pr0032 pulse[7700]: gratuitous lvs arps finished
Apr  7 21:51:28 pr0032 nanny[7703]: The following exited abnormally:
Apr  7 21:51:28 pr0032 nanny[7703]: failed to read remote load
Apr  7 21:51:08 pr0032 pulse[7700]: gratuitous lvs arps finished
Apr  7 21:51:28 pr0032 nanny[7703]: The following exited abnormally:
Apr  7 21:51:28 pr0032 nanny[7703]: failed to read remote load
Apr  7 21:51:48 pr0032 nanny[7703]: The following exited abnormally:
Apr  7 21:51:48 pr0032 nanny[7703]: failed to read remote load
Apr  7 21:52:08 pr0032 nanny[7703]: The following exited abnormally:
Apr  7 21:52:08 pr0032 nanny[7703]: failed to read remote load
Apr  7 21:52:28 pr0032 nanny[7703]: The following exited abnormally:

What am i missing here? Is it necessary to use piranha-gui to
configure pulse? I am using Fedora core 6.
When I switch off one of my real server it is not switching to real
server2. My logs showing errors in nanny for reading load. Do i need
to make some changes on my real servers?

Thanks and regards
Anuj Singh
