From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm/devfs bug?
Message-ID: <20030408204334.GD22951@percy.comedia.it>
References: <1049829705.2312.16.camel@rich>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1049829705.2312.16.camel@rich>
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
Date: Tue Apr  8 15:43:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Apr 08, 2003 at 12:21:45PM -0700, Rich Turner wrote:
>i am able to confirm that /proc/partitions does not have a partition
>entry for the disk but pvcreate still fails. i am using a devfs kernel
>so i thought there might be some strange behavior between lvm and devfs.
>is there a fix or known issues regarding lvm and devfs?
>
if you have devfs you should use the devfs long mane to reference your pv
eg: /dev/scsi/host0/bus0/target0/lun0/disc
as to why the error message is misleading i would not say, lvm1 tools are
very buggy wrt the handling of device names.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
