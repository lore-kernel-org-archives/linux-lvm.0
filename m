From: Stephan Austermuehle <au@hcsd.de>
Message-ID: <20020604180039.I8663@babbage.hcsd.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Cannot deactivate VG when shutting down
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
Date: Tue Jun  4 11:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I set up a Debian system that is completely installed on LVs including
the root filesystem. When shutting down the system deactivating the
Volume Group fails because the root filesystem is still mounted
(read-only). Is there already a solution available for this problem or
can the VG safely remain activated when shutting down?

Kind regards,

Stephan
