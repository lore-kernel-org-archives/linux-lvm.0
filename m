Received: from nb.net.home (ovpn-113-79.phx2.redhat.com [10.3.113.79])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2MANJSR013373
	for <linux-lvm@redhat.com>; Tue, 22 Mar 2011 06:23:19 -0400
Date: Tue, 22 Mar 2011 11:23:22 +0100
From: Karel Zak <kzak@redhat.com>
Message-ID: <20110322102322.GK21093@nb.net.home>
References: <4D7E4689.9060300@cox.net> <20110314171726.GA18249@redhat.com>
	<4D812183.6000901@cfl.rr.com> <20110316225539.GA3662@redhat.com>
	<4D8151EF.5020301@cfl.rr.com>
	<yq1vczivauz.fsf@sermon.lab.mkp.net> <4D829D86.3050001@cox.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4D829D86.3050001@cox.net>
Subject: Re: [linux-lvm] Advanced Format disks mixed with regular disks?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Mar 17, 2011 at 06:47:18PM -0500, Ron Johnson wrote:
> On 03/16/2011 07:39 PM, Martin K. Petersen wrote:
>>>>>>> "Phillip" == Phillip Susi<psusi@cfl.rr.com>  writes:
>>
>> Phillip>  The kernel has the ability to read it from the drive and report
>> Phillip>  it to the user space tools, which have been patched to use it,
>> Phillip>  but the WD EARS drives lie and claim 512/512 instead of
>> Phillip>  512/4096.
>>
>> The saving grace is that modern util-linux/dm tooling aligns on 1MB by
>> default instead of sector 63.
>>
>
> So, given the correct options ( -c -b 4096 ), v2.17.2 will handle the 2TB 
> WD Caviar Green WD20EARS drives which I just bought for my external 
> backup device...  Right?

The -b option is usually unnecessary (for v2.17 is the -c enough).

It seems (according to feedback from users) that newer WDxxEARS disks
are already fixed. 
http://community.wdc.com/t5/Desktop/Problem-with-WD-Advanced-Format-drive-in-LINUX-WD15EARS/m-p/20675#M1245


Try

  hdparm -I /dev/<disk>

to see more details, for example:

    Logical  Sector size:                   512 bytes
    Physical Sector size:                  4096 bytes

and
 
   # cat /sys/block/<disk>/queue/physical_block_size
   4096


It's also better to update to util-linux v2.18 or v2.19 where all the
new features are enabled by default (so -c is unnecessary too).

    Karel

-- 
 Karel Zak  <kzak@redhat.com>
 http://karelzak.blogspot.com
