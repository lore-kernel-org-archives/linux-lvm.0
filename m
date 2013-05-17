Received: from localhost (vpn1-6-117.ams2.redhat.com [10.36.6.117])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r4HEn67M007462
	for <linux-lvm@redhat.com>; Fri, 17 May 2013 10:49:06 -0400
Date: Fri, 17 May 2013 15:49:06 +0100
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20130517144905.GA21204@debian>
References: <51963E47.8060000@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51963E47.8060000@ubuntu.com>
Subject: Re: [linux-lvm] thin-provisioning-tools not part of lvm?
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

On Fri, May 17, 2013 at 10:27:19AM -0400, Phillip Susi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Why are helper programs required for lvm to use thin provisioning
> volumes not part of the lvm source package?

a) Because the whole point of device-mapper is it doesn't tie you in to a
single volume manager.  Unfortunately EVMS doesn't seem to be
developed any more, so LVM2 has become the defacto choice.


b) Because the LVM2 codebase is too big and riddled with closely
coupled code that means making any changes takes forever.

- Joe
