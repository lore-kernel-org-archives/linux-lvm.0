From: sander@sanderscorner.com
Message-ID: <15328525614.20020622191120@wanadoo.nl>
Subject: Re[2]: [linux-lvm] ext2online and 2.4.18
In-Reply-To: <20020622081138.GC22411@clusterfs.com>
References: <1024512969.1862.6.camel@hiro.prowell.org.bogus>
 <20020619195508.GA22427@clusterfs.com>
 <1024521044.1861.6.camel@hiro.prowell.org.bogus>
 <20020619214731.GB22427@clusterfs.com>
 <1024525638.1861.54.camel@hiro.prowell.org.bogus>
 <1024572480.3d11bc400c205@webmail3.wanadoo.nl>
 <20020620163420.GN22427@clusterfs.com> <482222938.20020621234918@wanadoo.nl>
 <20020622081138.GC22411@clusterfs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Sat Jun 22 12:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

(Response to message from Andreas Dilger, adilger@clusterfs.com on Saturday, June 22, 2002 10:11:38 AM)

Hello Andreas,

Got it working! I had previously just put CONFIG_EXT2_RESIZE=y in the
.config manually and now let the configure menu do the work.

I guess that's what happens if you take a shortcut.

-- 

Regards,
sander

Saturday, June 22, 2002, 10:11:38 AM, you wrote:

> This would indicate that the filesystem you are trying to resize does
> not have the kernel patch applied.

> Cheers, Andreas
> --
> Andreas Dilger
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> http://sourceforge.net/projects/ext2resize/


> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
