From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@users.sourceforge.net>
Message-ID: <yw1xptgvk92l.fsf@users.sourceforge.net>
References: <3F903230.9070608@siue.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: LVM ext3 support
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
Date: Fri Oct 17 13:34:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

anthony mayes <anmayes@siue.edu> writes:

> I am running Redhat 9 with kernel 2.4.20-20.9.  I am getting the
> following errors when trying to mount an LVM snapshot:
>
> EXT3-fs: INFO: recovery required on readonly filesystem.
> EXT3-fs: write access unavailable, cannot proceed.
>
> I saw a thread on redhat.com that said a kernel patch is needed.  My

BS.  You are trying to mount a non-clean filesystem on a read-only
LV.  I don't know why your LV is read-only.  You should find out why
it is, make it writable, and run fsck on it.  After that, you should
be able to mount it.

-- 
M�ns Rullg�rd
mru@users.sf.net
