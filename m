From: John_Cuzzola <vdrifter@enterprise.sd73.bc.ca>
Message-ID: <Pine.LNX.4.21.0207081527110.7706-100000@enterprise.sd73.bc.ca>
MIME-Version: 1.0
Subject: [linux-lvm] Reiser & snapshots
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
Date: Mon Jul  8 17:33:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello everyone,
 I'm new to this list and I was hoping someone could answer the following
question. My setup:


LVM-1.0.4
Kernel: 2.4.17
FileSystem: Reiser


When I take a snapshot of a mounted reiser volume the resulting snapshot
is corrupt. If the volume is unmounted then I take the snapshot it seems
to be fine. I've searched the web and found that this is a known problem
however the fix was to apply a VFS patch. The patch was for 2.4.11 and I
couldn't find one for 2.4.17. Is snapshots of mounted reiser volumes still
a problem? Will upgrading to 2.4.18 kernel fix it?

Thanks :)
