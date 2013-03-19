Date: Tue, 19 Mar 2013 11:54:56 -0400
From: David Teigland <teigland@redhat.com>
Message-ID: <20130319155456.GC986@redhat.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<1363699970-10002-11-git-send-email-bubble@hoster-ok.com>
	<20130319153215.GB986@redhat.com> <5148874A.2060106@hoster-ok.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5148874A.2060106@hoster-ok.com>
Subject: Re: [linux-lvm] [PATCH 10/10] man: document --node option to
	lvchange
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
To: Vladislav Bogdanov <bubble@hoster-ok.com>
Cc: linux-lvm@redhat.com

On Tue, Mar 19, 2013 at 06:42:02PM +0300, Vladislav Bogdanov wrote:
> And... Every cluster has nodes. Clustered LVM VG assumes you have
> cluster. Why not be cluster-aware in tools then?

The changes I'm making move away from remote command execution within lvm
itself because it's poor a design and complicates things tremendously for
a dubious feature.  Also, it would not fit well at all with sanlock which
I'm adding support for.  There are much better ways of doing remote
commands.
