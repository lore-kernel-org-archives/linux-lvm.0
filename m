From: Qv6 <sundiatah1@comcast.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200309230122.09869.sundiatah1@comcast.net>
Subject: [linux-lvm] vgcreate problem
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
Date: Tue Sep 23 01:25:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

	
Hi,

I just created 2 PVs with the following commands:

pvcreate /dev/hda6

pvcreate /dev/hdb

When I ran vgcreate, I got this error:

vgcreate gentis /dev/hda6 /dev/hdb

vgcreate -- no valid physical volumes in command line

Any help to resolve this error will be appreciated.

Qv6
