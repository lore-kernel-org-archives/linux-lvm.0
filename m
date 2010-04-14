Date: Wed, 14 Apr 2010 16:05:04 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4BC5D58F.2030809@cfl.rr.com>
Message-ID: <Pine.LNX.4.64.1004141603170.14791@bmsred.bmsi.com>
References: <4BC58DF3.608@redhat.com> <4BC5D58F.2030809@cfl.rr.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems resizing physical volume
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Avi Kivity <avi@redhat.com>

On Wed, 14 Apr 2010, Phillip Susi wrote:

> This doesn't directly address your issue, but I'd point out that if
> /boot were itself an lv instead of a normal partition, resizing it would
> be easy ;)
> 
> Personally I just leave /boot on the root lv.

Is that with GRUB or LILO?  Last I knew, grub on EL5.4 didn't support
booting from LVM.  I assume LILO would work, since it goes by absolute
sectors.  Which GRUB version supports LVM?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
