From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Reducing the size of a physical volume
Message-ID: <20031020212134.GC12151@percy.comedia.it>
References: <sf9016d7.065@greyhound.com> <1066656685.27744.23.camel@pc>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1066656685.27744.23.camel@pc>
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
Date: Mon Oct 20 16:23:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: linux-lvm@sistina.com, clacour@greyhound.com

I confirm Mandrake 9.2 is able to install on LVM.
That includes booting from LVM and using a LV as root fileystem.
you need to chose expert install to be able to do this tough.

Regards,
L.
On Mon, Oct 20, 2003 at 09:31:25AM -0400, Brian J. Murrell wrote:
>On Fri, 2003-10-17 at 17:20, Charles Lacour wrote:
>> 
>> I wanted to check out Mandrake 9.2,
>
>Good idea.  :-)
>
>> so I set up a "mandrake"
>> logical volume, but Mandrake doesn't seem to support LVM
>
>[ disclaimer: I have not gone through an "installation" of 9.2 yet --
>all of my systems were 9.1 which I just urpmi --auto-select upgraded
>after reconfiguring the sources -- but unless anything has changed since
>9.1, my comments should be accurate ]
>
>It sure does!  Diskdrake has supported creating PVs, VGs and LVs for
>quite a few releases now but not creating / as an LV.  As of the last
>release or two, I submitted enhancements to the installer to allow
>installation onto a root LV.
>
>Did you choose "Expert" installation, or choose the "Advanced" mode when
>you got into Diskdrake?  You likely need to do that to see the LVM
>options.



-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
