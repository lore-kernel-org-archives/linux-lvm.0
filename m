Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i923sdr28692
	for <linux-lvm@redhat.com>; Fri, 1 Oct 2004 23:54:39 -0400
Received: from ddg.com (mail.ddg.com [66.93.83.131])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i923sXBM000551
	for <linux-lvm@redhat.com>; Fri, 1 Oct 2004 23:54:39 -0400
Received: from [192.168.1.7] (account awd HELO [192.168.1.253])
	by ddg.com (CommuniGate Pro SMTP 4.2.3)
	with ESMTP-TLS id 2196162 for linux-lvm@redhat.com;
	Fri, 01 Oct 2004 22:54:28 -0500
Mime-Version: 1.0 (Apple Message framework v619)
Message-Id: <C0FE7CEC-1426-11D9-8CF2-000A9566A350@DDG.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-2-270465750
From: "Andrew W. Donoho" <awd@DDG.com>
Date: Fri, 1 Oct 2004 22:54:26 -0500
Subject: [linux-lvm] FC2, LVM2 and x86_64
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--Apple-Mail-2-270465750
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed

Folks,

	I am a happy new user of FC2 (x86_64 version) and LVM2 on an AMD64 
SOHO server. Unfortunately, I do have a problem that was revealed when 
I added a second hard drive to my LVM2 managed root partition. With the 
new hard drive (which smartd claims is working fine), I get what looks 
like a kernel panic. Even though I do not have any experience 
instrumenting a Linux system, it appears that my mail server, 
CommuniGate Pro, is triggering the panic. My discussions with the 
vendor lead me to believe that, while their code drives the system 
hard, it is not the root cause of the panic. I have been able to get 
the system to stabilize by downgrading my kernel to 2.6.5-1.358 and 
running the 32 bit version of CommuniGate Pro and not the 64 bit 
version. When running the 64 bit version of CommuniGate Pro, panics 
generally occur within 12 to 18 hours after startup. Hence, I would be 
happy to follow advice on how to instrument this system to find out 
what is going on. I suspect LVM2 because the problem showed up when I 
added a second physical volume to the LVM2 managed root partition.

Any thoughts/advice on what I can do to narrow this down?

Thanks,
Andrew

____________________________________
Andrew W. Donoho
awd@DDG.com, PGP Key ID: 0x81D0F250
+1 (512) 453-6652 (o), +1 (512) 750-7596 (m)


--Apple-Mail-2-270465750
Content-Transfer-Encoding: 7bit
Content-Type: text/enriched;
	charset=US-ASCII

Folks,


	I am a happy new user of FC2 (x86_64 version) and LVM2 on an AMD64
SOHO server. Unfortunately, I do have a problem that was revealed when
I added a second hard drive to my LVM2 managed root partition. With
the new hard drive (which smartd claims is working fine), I get what
looks like a kernel panic. Even though I do not have any experience
instrumenting a Linux system, it appears that my mail server,
CommuniGate Pro, is triggering the panic. My discussions with the
vendor lead me to believe that, while their code drives the system
hard, it is not the root cause of the panic. I have been able to get
the system to stabilize by downgrading my kernel to 2.6.5-1.358 and
running the 32 bit version of CommuniGate Pro and not the 64 bit
version. When running the 64 bit version of CommuniGate Pro, panics
generally occur within 12 to 18 hours after startup. Hence, I would be
happy to follow advice on how to instrument this system to find out
what is going on. I suspect LVM2 because the problem showed up when I
added a second physical volume to the LVM2 managed root partition.


Any thoughts/advice on what I can do to narrow this down?


Thanks,

Andrew


<fontfamily><param>Helvetica</param>____________________________________

Andrew W. Donoho

awd@DDG.com, PGP Key ID: 0x81D0F250

+1 (512) 453-6652 (o), +1 (512) 750-7596 (m)


</fontfamily>
--Apple-Mail-2-270465750--
