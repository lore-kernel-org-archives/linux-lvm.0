Return-Path: <tandem@dnmi.no>
Subject: Re: [linux-lvm] segfaults and "VGDATA .. inconsistent" beta7 tools
References: <Pine.LNX.4.33.0105150857180.24660-100000@rossi.itg.ie>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 15 May 2001 11:33:39 +0200
In-Reply-To: Paul Jakma's message of "Tue, 15 May 2001 09:04:54 +0100 (IST)"
Message-ID: <wvvgn3ez2k.fsf@freeze.oslo.dnmi.no>
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

>>>>> "Paul" == Paul Jakma <paulj@itg.ie> writes:

    Paul> I have the same problem with 2 machines.  They are both
    Paul> running 2.4.5-pre1 with LVM 0.9.1beta7 patch applied and the
    Paul> beta7 RPMs. On boot they run vgscan then vgchange -ay. (and
    Paul> i've tried running pvscan too)

My usual suggestion - have you checked the kernel logs for any other
problems, IDE/SCSI, ...

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
