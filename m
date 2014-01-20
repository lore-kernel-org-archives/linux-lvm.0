Message-ID: <52DD0DF7.6030503@redhat.com>
Date: Mon, 20 Jan 2014 12:52:23 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <87zjmxzmga.fsf@red.mvo.lan>,
	<87y52fdiyp.fsf@red.mvo.lan> <87vbxieno5.fsf@red.mvo.lan>
In-Reply-To: <87vbxieno5.fsf@red.mvo.lan>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Identifying useable block devices
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Marius Vollmer <marius.vollmer@redhat.com>

On 01/17/2014 02:35 PM, Marius Vollmer wrote:
> Marius Vollmer <marius.vollmer@redhat.com> writes:
> 
>> Hmm, DM_UDEV_DISABLE_OTHER_RULES_FLAG is (now) set for thin volumes, as
>> far as I can tell.
> 
> For what it's worth, the DM_UDEV_DISABLE_OTHER_RULES_FLAG disappears
> when cycling the volume to inactive and back to active.
> 

Yes, exactly - that's because the flag is set only during LV creation,
not on further deactivation/activation cycle - it's just about avoiding
any scanning before the LV is properly initialized during its
creation as described in my previous post...

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


-- 
Peter
