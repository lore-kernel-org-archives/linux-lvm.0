From: Geert Jansen <geertj@boskant.nl>
Message-ID: <20021024202158.GA28065@vader.boskant.nl>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 and reiserfsck
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
Date: Thu Oct 24 15:22:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Dear LVM developers,

there seems to be a problems with LVM2 and reiserfsck. I use the following
software:

* Linux 2.5.44-ac2 with device-mapper support
* reiserfsprogs 3.6.3 (latest)
* current device-mapper software
* current LVM2 tools

During start-up, reiserfsck fails to run on any reiserfs that resides on an LVM
managed volume. It fails with the following error message:

  bread: cannot read some block #2

Mounting the fs goes work just fine, it is only the fsck that gives trouble.

Does anybody know what is causing this problem and if there exists a patch?
I'd be happy to provide more data or try a patch.

Regards,
Geert Jansen
