Subject: Re: [linux-lvm] ext2resize "compat 20 feature" error
Message-ID: <20030321130855.GA20432@gw.silicide.dk>
References: <20030321122848.GA3352@birko.cjb.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030321122848.GA3352@birko.cjb.net>
From: Debian User <jb@silicide.dk>
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
Date: Fri Mar 21 07:09:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Mar 21, 2003 at 01:28:48PM +0100, Dave Lister wrote:
> Hi, I've recently set up LVM on my computer. I've created VG "birko"
> and on that, LV "share" (ext3). Later, I added two other disks to VG
> "birko" and lvextend-ed "share". Everything worked fine until I've 
> tried to ext2resize LV "share". This error message emerged:

did you unmount the file system ?



JonB
