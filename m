From: Spam <spam@tnonline.net>
Message-ID: <13712767906.20031118014426@tnonline.net>
Subject: Re: [linux-lvm] Performance problem.
In-Reply-To: <003601c3ad5d$c74c8370$6402000a@gasaraki>
References: 
 <3FB8F8A1.1060004@clin.ucl.ac.be><1069087854.2408.0.camel@localhost.localdomain><20031117181007.00e15a29.neuron@hollowtube.mine.nu><3252989968.20031117183528@tnonline.net><20031117191324.2047dbf3.neuron@hollowtube.mine.nu><11955855390.20031117192313@tnonline.net><20031117193054.5dd7eec1.neuron@hollowtube.mine.nu><6557103468.20031117194401@tnonline.net><20031117195218.3093c921.neuron@hollowtube.mine.nu><15458132953.20031117200111@tnonline.net>
 <20031117200500.08c5c876.neuron@hollowtube.mine.nu>
 <003601c3ad5d$c74c8370$6402000a@gasaraki>
MIME-Version: 1.0
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
Date: Mon Nov 17 18:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Henric Andersson <linux-lvm@sistina.com>

  Hm.  You  seem  to  have  quite the problem :( Could it be that some
  logging  is  turned  on  and spewing data as soon as you copy larger
  files  etc? Have you looked on CPU usage while copying, or looked on
  IRQ assignments (NIC might share with IDE controller)?

  Could  also  be NIC that is not using a good driver? I have had that
  before  both  with  Intel  and  RealTek  cards.  Actually,  when you
  mention it there are two Intel Pro 100 drivers in the kernel (Donald
  Becker and Intel original I think). Try switching between the two.

  Did you try Samba or FTP locally? If that works good then it is most
  likely something to do with the networking parts of your system.


>> dd_rescue /dev/vg_main/storagelv /dev/null
>>
>> dd_rescue: (info): ipos:    138384.0k, opos:    138384.0k, xferd:
> 138384.0k
>>                    errs:      0, errxfer:         0.0k, succxfer:
> 138384.0k
>>              +curr.rate:    27966kB/s, avg.rate:    27553kB/s, avg.load:
> 20.9%

> This proves nothing I'm afraid. I've done similar tests myself and even
> gotten bonnie to produce results that "look good", but these are all
> synthetic benchmarks. What counts is realworld performance. I tested bonnie
> (locally on lvm and regular partitions) and regular filecopy with time
> (using a 512MB file) between LVM to the system drive. Also tried NFS
> compared to Samba and it made no difference. FTP proved the same. At the
> beginning of all the test where I could see the actual speed, it would be
> right on spot (ie, maxing out my 100mbit switched network) but after 10
> seconds or so, the speed would drop dramatically to 2-4mb/s (from ~9mb/s)
> and then even halt completely for a short while and then resuming at 2-4mb/s
> (and this with no other network/disk access on the server). Oh, and to
> eliminate the destination drive completely during tests, I also tried "time
cat big512mbfile >> /dev/null", which, ofcourse,
cat big512mbfile >> resulted in the same speed
> as every other test I did.

> This is starting to become a pain. For example, I'm unable to burn my backup
> tarfiles to DVD over the network without empting the buffer (thank good for
> powerburn) which is ridiculous since all it requires is a consistant 4mb/s
> or so. I'm going to try the devicemapper in 2.6 (LVM2), but I haven't had
> the time to do it yet (have to create a similar setup since I dont want to
> risk the data for a little test).

> Oh, and before you ask, the server is a Celeron@2Ghz, with 512MB memory, all
> filesystems are ext3, all drives are master and use the correct ATA/133
> cable. All drives use dma and 32bit with sync transfers. The server's sole
> purpose in life is to provide storage for my network. It uses an nice Intel
> Pro/100 card to ensure stability and performance. The network is 100mbit
> full duplex switched to allow max speed. When transfering files from a
> normal partition (ie, /dev/hdax) I get about 9-9.5mb/s with samba and
> Win2kPro (measured with the Kerio Firewall on the Win2k and IpTraf locally
> on the fileserver).

> (The serverhardware was purchased since I figured that my previous 120Mhz
> Pentium Classic was the bottleneck  :-/ )

> /Henric


> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
