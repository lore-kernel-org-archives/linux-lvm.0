Date: Fri, 27 Oct 2000 01:15:12 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: Re: [linux-lvm] [RFC] LVM mainatainance release
Message-ID: <20001027011512.A9942@gondor.com>
References: <20001026215248.A23413@caldera.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20001026215248.A23413@caldera.de>; from hch@caldera.de on Thu, Oct 26, 2000 at 09:52:48PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelshagen@sistina.com>, linux-lvm@msede.com

On Thu, Oct 26, 2000 at 09:52:48PM +0200, Christoph Hellwig wrote:
> If no one else is interested I would like to take the job and try
> to get a 0.8.1 out. This should consist of a fixed tools tarball
> and a patch for Linux 2.2.

Yes, please do it! :-)

As Heinz seems to release his next version as 0.9, there will be no numbering
conflicts, and even if your 0.8.1 will not be 'made official' by him, it'll
be a common ground for further 0.8 bugfixing. 

Heinz did a great job with LVM, but still I bet 0.9 will have some 
nasty new bugs, so people using LVM on production systems will prefer
using 0.8+patches over 0.9 for some time.

The problem I have with Andreas' RPMs is, that there are no announcements
of new versions (at least not on any mailing list I read), so I need to
regularily check if they contain some new patches I need. And tar is more
convenient for people not using rpm.

Jan
