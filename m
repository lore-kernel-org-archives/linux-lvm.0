From: "Kai-Min Sung" <k@kaisung.com>
Message-ID: <000801c3146b$31318150$09fea8c0@nimiak>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] crash during metadata operations
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
Date: Wed May  7 02:35:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux-lvm@sistina.com

I was curious how LVM1/LVM2 handles a crash in the middle of a metadata
operation. I presume an operation such as vgextend will update the
mapping in the VGDA section of the disk. What happens if you crash in
the middle of updating the VGDA? Hopefully, you don't end up with a
partial mapping. I can see a way of guaranteeing atomicity by
maintaining two VGDA sections and including a timestamp at the end of
each write. Does LVM do something like this?

Regards,
-Kai
