Date: Fri, 1 Apr 2005 16:10:01 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20050401151001.GB14307@agk.surrey.redhat.com>
References: <20050401142031.GA21976@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050401142031.GA21976@wavehammer.waldi.eu.org>
Subject: [linux-lvm] Re: [Linux-cluster] [PATCH] iddev - convert to general
	purpose device identifier
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-cluster@redhat.com
Cc: linux-lvm@redhat.com

On Fri, Apr 01, 2005 at 04:20:31PM +0200, Bastian Blank wrote:
> I currently try to do some cleanups in lvm2/fsadm. This tool currently
> relies on an entry in /etc/fstab to get the filesystem type and a
> temporary mount to get the block size. With this changes I can just use
> iddev to gather the informations.
 
Also, if online and offline resizers are both available, fsadm
should choose whichever is most appropriate according to whether
the filesystem is already mounted or not.

Alasdair
-- 
agk@redhat.com
