From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Moving a PV to a new, larger, disk.
Message-ID: <159510000.1074632803@[192.168.100.3]>
In-Reply-To: <1424171942.20040113154554@tnonline.net>
References: <1424171942.20040113154554@tnonline.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Tue Jan 20 16:11:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>   Is it possible to use dd/dd_rescue to simply copy a PV to a new disk
>   that is slightly (16MiB)larger?
>
>   The old pv is on /dev/hdb1 and the new disk is /dev/hdc and is
>   unpartitioned so far. How would I proceed to make this work?
>
>   This might seem odd to do as I could perhaps use pvmove, but pvmove
>   requires the whole vg to be present in the system, right?

Why not back it up to stable media and restore it (or do the
move on the same day you make your normal image backups). That
way if anything goes wrong you can just say a few words and
start the restore over...


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 888 359 3508
