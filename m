From: neuron <neuron@hollowtube.mine.nu>
Subject: Re: [linux-lvm] Performance problem.
Message-Id: <20031118020523.65476a55.neuron@hollowtube.mine.nu>
In-Reply-To: <13712767906.20031118014426@tnonline.net>
References: <3FB8F8A1.1060004@clin.ucl.ac.be>
	<1069087854.2408.0.camel@localhost.localdomain>
	<20031117181007.00e15a29.neuron@hollowtube.mine.nu>
	<3252989968.20031117183528@tnonline.net>
	<20031117191324.2047dbf3.neuron@hollowtube.mine.nu>
	<11955855390.20031117192313@tnonline.net>
	<20031117193054.5dd7eec1.neuron@hollowtube.mine.nu>
	<6557103468.20031117194401@tnonline.net>
	<20031117195218.3093c921.neuron@hollowtube.mine.nu>
	<15458132953.20031117200111@tnonline.net>
	<20031117200500.08c5c876.neuron@hollowtube.mine.nu>
	<003601c3ad5d$c74c8370$6402000a@gasaraki>
	<13712767906.20031118014426@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Nov 17 19:07:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

ftp to localhost
starts on 10.2mb/sec, goes stable for a short while, then stops for a few seconds (4-5), then continues in about 5-6 until the transfer is complete.

all my stuff are on seperate irq's.

when I copy, "system" load skyrockets, 60-85%.
lftp and glftpd is the processes using resources.  I could try smb aswell, but I'm guessing I'll find that eating my system resources aswell.

> 
>   Hm.  You  seem  to  have  quite the problem :( Could it be that some
>   logging  is  turned  on  and spewing data as soon as you copy larger
>   files  etc? Have you looked on CPU usage while copying, or looked on
>   IRQ assignments (NIC might share with IDE controller)?
> 
>   Could  also  be NIC that is not using a good driver? I have had that
>   before  both  with  Intel  and  RealTek  cards.  Actually,  when you
>   mention it there are two Intel Pro 100 drivers in the kernel (Donald
>   Becker and Intel original I think). Try switching between the two.
> 
>   Did you try Samba or FTP locally? If that works good then it is most
>   likely something to do with the networking parts of your system.
>
