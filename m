Message-ID: <3F903945.6090109@backtobasicsmgmt.com>
From: "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: LVM ext3 support
References: <3F903230.9070608@siue.edu> <yw1xptgvk92l.fsf@users.sourceforge.net>
In-Reply-To: <yw1xptgvk92l.fsf@users.sourceforge.net>
Content-Transfer-Encoding: 8bit
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
Date: Fri Oct 17 14:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

M�ns Rullg�rd wrote:

> BS.  You are trying to mount a non-clean filesystem on a read-only
> LV.  I don't know why your LV is read-only.  You should find out why
> it is, make it writable, and run fsck on it.  After that, you should
> be able to mount it.

His LV is read-only because it's a snapshot. That means he took a 
snapshot of a unclean ext3 filesystem, and can't mount it because ext3 
wants to clean it up during the mount and cannot do so.

What is the recommended procedure for doing snapshots of journalling 
filesystems? Do the filesystems have to support snapshots directly and 
"quiesce" themselves while the snapshot is being created?
