Message-ID: <4C17D1BF.9010103@redhat.com>
Date: Tue, 15 Jun 2010 15:17:19 -0400
From: Takahiro Yasui <tyasui@redhat.com>
MIME-Version: 1.0
References: <4C179B03.2000102@cfl.rr.com>	<20100615164709.GG15698@agk-dp.fab.redhat.com>
	<4C17BC76.7090506@cfl.rr.com>
In-Reply-To: <4C17BC76.7090506@cfl.rr.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why does every lvm command insist on touching	every
 pv?
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
To: psusi@cfl.rr.com
Cc: linux-lvm@redhat.com

On 06/15/10 13:46, Phillip Susi wrote:
> On 6/15/2010 12:47 PM, Alasdair G Kergon wrote:
>> It shouldn't normally scan unless it detects something might have changed, but
>> if you know the volume group name(s) already, put them on the command line: 
>>   lvs vg1 vg2
>>
>> (As always -vvvv may give you clues as to what is triggering the scan.)
> 
> I can see from the output with -vvvv that it is indeed trying to find a
> pv label on every block device in /dev.  I thought that I had figured
> out this was because lvm.conf was setting scan = [ "/dev" ] in the
> devices section, but I tried removing /dev, and just setting it to "",
> as well as "none" and lvs -vvvv STILL is opening every block device in /dev.

Everytime lvm command is executed, all PVs are accessed.

This is a known issue and what we should fix. If there are a lot of
PVs, execution of lvm command could take a long time. The scan also
affects error recovery time of lvm mirror.

This is an old reference.

Introduce metadata cache feature
https://www.redhat.com/archives/lvm-devel/2009-April/msg00014.html

Thanks,
Taka
