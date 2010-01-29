Message-ID: <4B632DE7.80606@redhat.com>
Date: Fri, 29 Jan 2010 19:50:15 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <824411.76784.qm@web87113.mail.ird.yahoo.com>
	<4B62A89E.5060201@redhat.com>
	<359398.31635.qm@web87102.mail.ird.yahoo.com>
In-Reply-To: <359398.31635.qm@web87102.mail.ird.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] alternative to pvmove on root volume
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
To: chris procter <chris-procter@talk21.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 01/29/2010 07:26 PM, chris procter wrote:
> Unfortuately this project is mostly RHEL4 boxes (its an old SAN, nothing new has been added to it in a couple of years)
> and so thats what I've been testing with (RHEL4.5 to be precise) so if you really want me too
> I'll file a bug but I'm pretty sure it will just get closed with "upgrade to a modern version of lvm" :)

Ah so. Pretty old lvm2 version there. But both RHEL5 and RHEL4 share the same codebase,
just upgrade to RHEL4.8.
(you can even use statically linked lvm binary from newer version if you cannot upgrade...)

Milan
