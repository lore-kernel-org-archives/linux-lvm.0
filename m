From: Sander <sander@sanderscorner.com>
Message-ID: <1971029247.20020622113307@wanadoo.nl>
Subject: Re[2]: [linux-lvm] ext2online and 2.4.18
In-Reply-To: <20020621215903.GQ24903@lug-owl.de>
References: <1024512969.1862.6.camel@hiro.prowell.org.bogus>
 <20020619195508.GA22427@clusterfs.com>
 <1024521044.1861.6.camel@hiro.prowell.org.bogus>
 <20020619214731.GB22427@clusterfs.com>
 <1024525638.1861.54.camel@hiro.prowell.org.bogus>
 <1024572480.3d11bc400c205@webmail3.wanadoo.nl>
 <20020620163420.GN22427@clusterfs.com> <482222938.20020621234918@wanadoo.nl>
 <20020621215903.GQ24903@lug-owl.de>
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
Date: Sat Jun 22 04:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

(Response to message from Jan-Benedict Glaw, jbglaw@lug-owl.de on Friday, June 21, 2002 11:59:03 PM)

Hallo Jan-Benedict,

Yes, definately non-zero. This message never shows in an un-patched kernel and
fsck'ing happens automatically. On a previous occasion I checked the mount counts too.
They were perfectly ok.

-- 

Regards,
Sander

Friday, June 21, 2002, 11:59:03 PM, you wrote:

> Are you sure that this/those filesystem(s) have a non-zero value in
> /etc/fstab's "fs_passno" field (it's the 6th and last value in each
> row)?

> MfG, JBG
