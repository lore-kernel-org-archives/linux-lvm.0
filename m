From: "Erick Calder" <e@arix.com>
Subject: RE: [linux-lvm] ftp.sistina.com down? 
Date: Mon, 10 Sep 2001 12:20:23 -0700
Message-ID: <003001c13a2d$a3aa7080$0300000a@pacbell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <01Sep10.145314edt.230173@ugw.utcc.utoronto.ca>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Siebenmann <cks@utcc.utoronto.ca>
Cc: linux-lvm@sistina.com

hmm... according to a message from Taher Haveliwala (see: [linux-lvm]
installing lvm 1.0 on stock RedHat 7.1) it shouldn't be necessary for me to
package the whole kernel, thus avoiding the whole issue of configuration
files and patches...  I should, presumably, be able to just package the
module and user tools and be done with it... Taher made it work for 7.1... I
have a Guiness (7.0) box that I need to install LVM on so in the next few
days I'm going to test that theory... if it works the same RPM should work
for 7.1 systems as well...

- e r i c k

-----Original Message-----
From:	Chris Siebenmann [mailto:cks@utcc.utoronto.ca]
Sent:	Monday, September 10, 2001 11:53 AM
To:	Erick Calder
Subject:	Re: [linux-lvm] ftp.sistina.com down?

| thx. putting together the piece that deals with the user tools is
| probably not that difficult... the problem is that the spec files
| for building RH kernels are very busy and I'm trying to figure out
| what the differences are between all of them and how they need to be
| modified for the 2.4.9 kernel...

 In my personal opinion, you really don't want to do this. The Red
Hat kernels in their kernel RPMs are reasonably modified; integrating
another patch in there and making sure it all works well afterwards is
likely to be a very interesting challenge. Especially if repeated for
anything except the current kernels.

 While you can supply RPMs for stock 2.4.9 plus the LVM patches, this
may tempt people who are depending on Red Hat patches into upgrading
to your kernel -- with the resulting small explosions in their systems.

 Thus I think it is safer to tell people to patch their kernel
themselves. The most I would do in a RPM is include (in the the %doc
stuff) 'sample' patches for one or more kernels (stock 2.4.9 and the
current Red Hat kernel, likely). People could then apply them if they
felt confidant.

(The really time-consuming way would be to work out a self-contained
system for including the stuff the LVM source tree uses to generate the
kernel patch, and include *that* in the RPM. Then people could use the
installed binary RPM to generate the source patches to whatever kernel
they wanted, in the same way that building the source would do it.)

	- cks
