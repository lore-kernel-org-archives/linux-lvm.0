From: Holger Rauch <Holger.Rauch@heitec.de>
Subject: Re: [linux-lvm] Updated patch VFS-lock for 2.4.18+ XFS enabled
    kernels
In-Reply-To: <E16sOlU-0006vM-00@hermes.sistina.com>
Message-Id: <Pine.LNX.4.21.0204030944360.30084-100000@miami.datech2.er.heitec.net>
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
Date: Wed Apr  3 01:51:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

I tried your patch on a 2.4.18 kernel with XFS, but I got the following
error during the linking phase

fs/fs.o: In function `fsync_dev_lockfs':
fs/fs.o(.text+0x2918): undefined reference to `DQUOT_SYNC_DEV'

During compilation, I also got a warning about an implicit declaration of
DQUOT_SYNC_DEV.

I could apply the patch with no problems, however.

What went wrong here? How can I get rid of these errors?

Any help will be greatly appreciated!

Greetings,

	Holger
