From: GCS <gcs@lsc.hu>
Message-ID: <20011020111357.A13288@lsc.hu>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Kernel 2.4.12 bug?
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
Date: Sat Oct 20 04:01:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

Is there any known issues with kernel 2.4.12? My Debian Woody is complaining
about lvm during startup, and drops an oops when swapp is turned off, and lvm
is going to be deactivated. It is a paging error, eip seems to be trashed to
0x5a5a5a5a.

GCS
