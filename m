Message-ID: <20021218215632.405.qmail@web14407.mail.yahoo.com>
From: grenoml <grenoml@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: RH8 install - LVM sizing problem
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
Date: Wed Dec 18 15:56:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

An update to the problem:
  I finally reinstalled RH8 and made the following adjustments:
-pulled / out of LVM and put in its own partition
-increased both the size of / (5G) and /usr (15G)

  An 'everything' installation went fine this time with the only
problem being it was trying to run kudzu on the first reboot and when
it came up I had no mouse or keyboard so I rebooted and everything was
fine after that and so I finished the Setup config and Linux went to
the first login screen.  Once logged in I went to a terminal window and
ran pvdisplay and vgscan and received the exact same response as after
the first installation:

+ /sbin/pvdisplay
pvdisplay -- ERROR: "/etc/lvmtab" doesn't exist; please run vgscan

+ /sbin/vgscan
vgscan -- LVM driver/module not loaded?

So my question is what should I do to verify the state of LVM on the
system?

Regards,
Gerry Reno




__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
