Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Drive gone bad, now what?
Message-ID: <69596D9C5887874E9A35F6C8DF94B2ABA45EC6@nautilus>
From: "Victor Tan" <VictorTan@stts.com.sg>
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
Date: Wed Oct 29 00:54:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"I don't understand why some people want to put (soft) RAID on top of =
LVM rather than underneath it."

When I try to run software RAID underneath LVM2, lvcreate failed and =
reported inconsistent metadata of the vg. The UUID string was appended =
with another set of characters in lvdisplay.
