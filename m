Message-ID: <4FD8E9C6.2020600@redhat.com>
Date: Wed, 13 Jun 2012 12:28:06 -0700
From: Andy Grover <agrover@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [ANNOUNCE] targetd 0.1
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
Cc: libstoragemgmt-devel@lists.sourceforge.net, target-devel <target-devel@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, LVM general discussion and development <linux-lvm@redhat.com>

targetd allows the remote configuration of a storage appliance,
implemented using the capabilities of LVM, and the LIO kernel target.

It exposes an HTTP/jsonrpc service that should allow it to integrate
with other projects such as libstoragemanagement or OpenStack Volume.

targetd is a brand new project -- I'm looking for potential contributors
(it's licensed under GPLv3) as well as feedback on the API, and what
targetd's future direction should be.

Please see https://github.com/agrover/targetd for code and more info.

Regards -- Andy
