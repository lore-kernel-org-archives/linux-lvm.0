Subject: Re: [linux-lvm] LVM-1.0.1-rc4 and kernel-2.2.19 patch
References: <3BD1E714.B8CF216D@libertysurf.fr>
From: Adrian Phillips <a.phillips@dnmi.no>
In-Reply-To: <3BD1E714.B8CF216D@libertysurf.fr>
Message-ID: <wvofn15sgl.fsf@freeze.oslo.dnmi.no>
MIME-Version: 1.0
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
Date: Sun Oct 21 03:04:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Philippe" == Philippe Lefevre <ph.l@libertysurf.fr> writes:

    Philippe>  Hello all, I had to update my current kernel (2.2.17)
    Philippe> to 2.2.19 with ext3 but I totaly forget to check if a
    Philippe> patch were created for it to support LVM-1.0.1-rc4
    Philippe> (which runs fine for me with K2.4.10, thank you LVM team
    Philippe> !!)
 
    Philippe>  I was able to build one using the rawio patch designed
    Philippe> to 2.2.18 and easily fixing two small problems (two
    Philippe> hunks were failed) but I'm tiedous to apply it like
    Philippe> this.
 
2.2.18 would work fine but there was a problem with a change in rc4 -
check the archive; this is fixed in CVS but I haven't had any success
in connecting to CVS yet so I haven't so what was required to fix it
and nobody else seems to have had time yet either. My hope is that
there will be a rc5 soon with this fix in.

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
