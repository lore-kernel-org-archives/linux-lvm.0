Subject: Re: [linux-lvm] lvm-1.0.1 not working with DAC960/2.2.20
References: <wvbshoy54w.fsf@freeze.oslo.dnmi.no>
	<20011127111424.A8179@sistina.com> <20011127102808.A730@lynx.no>
From: Adrian Phillips <a.phillips@dnmi.no>
In-Reply-To: <20011127102808.A730@lynx.no>
Message-ID: <wv1yij762a.fsf@freeze.oslo.dnmi.no>
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
Date: Wed Nov 28 00:37:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Andreas" == Andreas Dilger <adilger@turbolabs.com> writes:
<snip>

    Andreas> Note that this will break other things, because you also
    Andreas> need to update the LVM_DEVICE_TYPE_<foo> defines when you
    Andreas> change this array (it was Joe or Alistair that wrote it
    Andreas> this way, not me).  It would also break to add a new enum
    Andreas> value for DAC960, because it means we need to look for
    Andreas> two values elsewhere in the code
    Andreas> (e.g. lvm_partition_count).

Thanks for noticing this. My patch "seemed" to work but I have almost
no experience with LVM code so missed the further reaching
consequences of my change.

    Andreas> I just checked in a fix, which cleans up this code a bit
    Andreas> and makes it impossible to get wrong in the future.

It would be useful if people could post patches to this list so that
individual changes could be tested by individuals on this list without
checking out the whole CVS which may include other patches which may
possibly break things.

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
