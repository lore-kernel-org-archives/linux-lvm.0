From: Sander <boeraa@wanadoo.nl>
Message-ID: <482222938.20020621234918@wanadoo.nl>
Subject: Re[2]: [linux-lvm] ext2online and 2.4.18
In-Reply-To: <20020620163420.GN22427@clusterfs.com>
References: <1024512969.1862.6.camel@hiro.prowell.org.bogus>
 <20020619195508.GA22427@clusterfs.com>
 <1024521044.1861.6.camel@hiro.prowell.org.bogus>
 <20020619214731.GB22427@clusterfs.com>
 <1024525638.1861.54.camel@hiro.prowell.org.bogus>
 <1024572480.3d11bc400c205@webmail3.wanadoo.nl>
 <20020620163420.GN22427@clusterfs.com>
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
Date: Fri Jun 21 16:49:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

(Response to message from Andreas Dilger, adilger@clusterfs.com on Thursday, June 20, 2002 6:34:20 PM)

Hallo Andreas,

One message in dmesg which I don't see in a kernel without the patch:
"EXT2-fs warning: maximal mount count reached, running e2fsck is
recommended", strange since I have fs checking automatically.
I have seen other messages on a few previous boots with a patched
kernel, that I unfortunately can not reproduce, where there are complaints about an
option 'resize' that is not understood.

No messages of this kind ended up in the messages file, or the debug
log. They only show when booting and in dmesg.

Guess this won't help much, but that's all I have for the moment.

-- 

Regards,
Sander

Thursday, June 20, 2002, 6:34:20 PM, you wrote:

> Could you be more specific?  Do you get any messages in syslog or from
> dmesg?  Does the command just lock up and never return?  If you mount
> the filesystem with "-o debug,check" you get a few extra messages that
> may help narrow down the problem.

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
