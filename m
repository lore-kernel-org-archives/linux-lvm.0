Subject: Re: [linux-lvm] lvm-1.0.1 not working with DAC960/2.2.20
References: <wvbshoy54w.fsf@freeze.oslo.dnmi.no>
	<20011127111424.A8179@sistina.com> <20011127102808.A730@lynx.no>
	<wv1yij762a.fsf@freeze.oslo.dnmi.no>
From: Adrian Phillips <a.phillips@dnmi.no>
In-Reply-To: <wv1yij762a.fsf@freeze.oslo.dnmi.no>
Message-ID: <wvu1vf5pmr.fsf@freeze.oslo.dnmi.no>
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
Date: Wed Nov 28 01:18:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Adrian" == Adrian Phillips <a.phillips@dnmi.no> writes:

<snip>
    Andreas> I just checked in a fix, which cleans up this code a bit
    Andreas> and makes it impossible to get wrong in the future.

    Adrian> It would be useful if people could post patches to this
    Adrian> list so that individual changes could be tested by
    Adrian> individuals on this list without checking out the whole
    Adrian> CVS which may include other patches which may possibly
    Adrian> break things.

Okay, forget this. I checked the web page and saw the CVS commit
mailing list which should give enough information to see which files
have changed.

Sorry about that.

Another question. I see from the commit list that various changes have
been made but doing an cvs update doesn't get me the latest changes :-

adilger     2001/11/27 11:41:24 CST

This is Andreas changes. Wiping the whole lot and checking out again
still doesn't give me the latest changes.

- Is this because changes are added to a tagged version ?
- or changes are made to a developers CVS and synced to the anonymous
  CVS ?

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
