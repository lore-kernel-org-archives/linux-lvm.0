Received: from localhost (vpn1-5-194.ams2.redhat.com [10.36.5.194])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r4SAPoH7011555
	for <linux-lvm@redhat.com>; Tue, 28 May 2013 06:25:50 -0400
Date: Tue, 28 May 2013 11:25:49 +0100
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20130528102549.GA1706@debian>
References: <51A329CA.2010806@mglug.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51A329CA.2010806@mglug.de>
Subject: Re: [linux-lvm] thin-provisioning-tools failed compiling on Ubuntu
 13.04
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, May 27, 2013 at 11:39:22AM +0200, Oliver Rath wrote:
> Hi lsit,
> 
> i wanted using thin-provisioned lvm-volumes on a new created Ubuntu
> 13.04-machine. Unfortunatly the needed thin-provisinoing-tools dont
> compile anymore.

I'm doing a lot of dev on the thin-prov tools atm.  If you want a
stable version please check out a tagged/released version (eg, 0.1.5).
Next release isn't far away.

- Joe
