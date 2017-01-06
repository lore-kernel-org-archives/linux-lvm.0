Date: Fri, 6 Jan 2017 13:19:02 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20170106191902.GB22165@redhat.com>
References: <78cb8a27a39f59bc31b11e1044af620f@dds.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78cb8a27a39f59bc31b11e1044af620f@dds.nl>
Subject: Re: [linux-lvm] how to change UUID of PV of duplicate partition
 (followup)
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
To: Xen <list@xenhideout.nl>
Cc: Linux lvm <linux-lvm@redhat.com>

On Fri, Jan 06, 2017 at 08:10:20PM +0100, Xen wrote:
> This is what I mean:
> 
>   Found duplicate PV 3U9ac3Ah5lcZUf03Iwm0cgMMaKxdflg0: using /dev/sdb4 not
> /dev/sdc4

The handling of duplicate PVs has been entirely redone in recent versions.
The problems you are having are well known and should now be fixed.
