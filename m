Return-Path: <tandem@dnmi.no>
Subject: Re: [linux-lvm] logical volumes extending beyond 1 machine
References: <B51F0C636E578A4E832D3958690CD73E0130BF3B@es04snlnt>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 14 Jun 2001 07:25:49 +0200
In-Reply-To: "Diehl, Jeffrey"'s message of "Thu, 7 Jun 2001 15:40:52 -0600"
Message-ID: <wvelsnd44i.fsf@freeze.oslo.dnmi.no>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Mike" == Diehl, Jeffrey <jdiehl@sandia.gov> writes:

    Mike> Actually, I think hew as refering to MFS (mosix fs).
    Mike> Unfortunately, this probably won't work since it's not
    Mike> really a block device, it's much more like an nfs mount.
    Mike> I've been watching this thread and have yet to see anyone
    Mike> answere if a network block device would work.  I think it
    Mike> would be neat...

You mean running LVM through ENBD, for example ?

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
