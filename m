From: "Kai-Min Sung" <k@kaisung.com>
Subject: RE: [linux-lvm] re: iSCSI and LVM
Message-ID: <000201c31be3$9eb516e0$3200a8c0@nimiak>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <0vcacvsnbiq3kpgokrl5co8iuhe78f1ud7@4ax.com>
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
Date: Fri May 16 14:44:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: 'Steve Brueggeman' <xioborg@yahoo.com>

Hi Steve,
	Yes, if you could find any patches that might help I'd greatly
appreciate it! I think you're right about the read_capacity being
hard-coded. I remember the disk size being reported as something like
1900MB. I'll try taking a closer look at the code later this weekend.

Thanks!
-Kai

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]
On Behalf Of Steve Brueggeman
Sent: Friday, May 16, 2003 12:01 PM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] re: iSCSI and LVM

About a year ago, I had worked with the UNH iSCSI driver backend.  I
ended up writing another backend that did reads/writes directly to the
block layer.

The backend that is (was? I haven't looked at it for a while) was
extremely simple minded, and will need a bit of work for proper
operation.  For example, when you used "file' as the backend, with the
file being the LV, you reported the capacity as being incorrect.  This
is because, (if  I recall correctly) the read_capacity SCSI command
was hard-coded to the file size of the file that would have been
created, had you not renamed it to the LV block dev.  You'll need to
check the actual size of the device  when a read_capacity command is
received.

Also, I don't recall any mode page support being there, and their
implementation of buffering is quite simplistic.

I'll see if I can find my old back-end patches.  Would you be
interested???

Steve Brueggeman


On Wed, 14 May 2003 23:43:09 -0700, you wrote:

>Hi Greg,
>	Thanks for responding. I'm currently trying out the iSCSI
>implementation provided by the UNH IOL iSCSI Consortium:
>
>http://www.iol.unh.edu/consortiums/iscsi/
>
>They provide modules for both target and initiator. Unfortunately, the
>implementation is based on the v18 draft and doesn't include support
for
>ErrorRecoveryLevel 2. I'd like level 2 recovery so that I can failover
>the node running the iSCSI target, and have the initiator automatically
>reconnect to the new iSCSI target node. Also, their implementation
>doesn't have support for setting up a logical volume as an iSCSI
target.
>You can specify a file as an iSCSI target, so I tried specifying the
>logical volume's block device file, but when I imported it on the
>initiator node, the capacity of the device was all screwed up. Anyways,
>I'll try your pointer to the Intel implementation and see if it works
>better. Alternatively, I may try looking into using ENBD to export the
>logical volumes.
>
>Thanks,
>-Kai 
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
