Message-ID: <4C17E56D.5010808@redhat.com>
Date: Tue, 15 Jun 2010 16:41:17 -0400
From: Takahiro Yasui <tyasui@redhat.com>
MIME-Version: 1.0
References: <4C179B03.2000102@cfl.rr.com>	<20100615164709.GG15698@agk-dp.fab.redhat.com>
	<4C17BC76.7090506@cfl.rr.com> <4C17D1BF.9010103@redhat.com>
	<4C17E16B.8000708@cfl.rr.com>
In-Reply-To: <4C17E16B.8000708@cfl.rr.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why does every lvm command insist on touching every
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
To: Phillip Susi <psusi@cfl.rr.com>
Cc: linux-lvm@redhat.com

On 06/15/10 16:24, Phillip Susi wrote:
> On 6/15/2010 3:17 PM, Takahiro Yasui wrote:
>> Everytime lvm command is executed, all PVs are accessed.
>>
>> This is a known issue and what we should fix. If there are a lot of
>> PVs, execution of lvm command could take a long time. The scan also
>> affects error recovery time of lvm mirror.
>>
>> This is an old reference.
>>
>> Introduce metadata cache feature
>> https://www.redhat.com/archives/lvm-devel/2009-April/msg00014.html
> 
> This seems to limit the number of metadata copies on pvs that are
> accessed to one, but I am seeing even block devices that are not pvs
> accessed, like it is scanning for new pvs.  This patch seems like it
> would help some though, but it is over a year old.  Did it never get
> applied?

As for accessing block devices, you can limit accesses to those
devices by filter option in lvm.conf. This is an example which
allows accesses only to /dev/sd*

    filter = [ "a|/dev/sd|", "r|.*|" ]

You can specify more strict rule like

    filter = [ "a|/dev/sd[a-z]|", "r|.*|" ]

For my patch, I posted it one year ago but I need to have more
discussion how to solve this issue on lvm-devel.

Thanks,
Taka
