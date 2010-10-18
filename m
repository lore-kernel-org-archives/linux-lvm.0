Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o9IAHNb4017776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2010 06:17:25 -0400
Message-ID: <4CBC1EB3.1080802@redhat.com>
Date: Mon, 18 Oct 2010 11:17:23 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <AANLkTinq9zzcT_+tfkQ6KZMh86ay0jHGegP6xpUtqzFQ@mail.gmail.com>
In-Reply-To: <AANLkTinq9zzcT_+tfkQ6KZMh86ay0jHGegP6xpUtqzFQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvdisplay "Found duplicate"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 10/18/2010 09:49 AM, Guifre Bosch Fabregas wrote:
> Hi!
> 
> When I launch the command pvdisplay I see the error "*Found duplicate PV*"
> 
> I search in google this error and some persons talk about this document 
> http://kbase.redhat.com/faq/docs/DOC-2991 but this document only can see with 
> any subscription.
> 
> Anybody have this problem or know any solution?

You don't mention what storage setup you are using but if you have
multipath storage then you will need to configure filters in
/etc/lvm/lvm.conf to exclude the individual paths and ensure that LVM2
only uses the multipath devices.

If this isn't the problem you're having then you're going to need to
describe your situation in more detail (include command output & a
description of your environment) for people to be able to help you.

Regards,
Bryn.
