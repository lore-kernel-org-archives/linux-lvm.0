Return-Path: <ragnark@stine.vestdata.no>
Date: Mon, 11 Jun 2001 15:49:19 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Message-ID: <20010611154917.F7798@vestdata.no>
References: <20010610222138.A21955@mind.bartosch.net> <20010610222719.B21955@mind.bartosch.net> <20010611064459.C21955@mind.bartosch.net>
Mime-Version: 1.0
In-Reply-To: <20010611064459.C21955@mind.bartosch.net>; from Peter Bartosch on Mon, Jun 11, 2001 at 06:44:59AM +0200
Subject: [linux-lvm] Re: [reiserfs-list] Reiserfs fragments my MP3
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
Content-Transfer-Encoding: 7bit
To: Peter Bartosch <peter@bartosch.net>, Reiserfs List <reiserfs-list@namesys.com>, Linux LVM List <linux-lvm@sistina.com>

On Mon, Jun 11, 2001 at 06:44:59AM +0200, Peter Bartosch wrote:
> BTW: could someone tell me if there's a linux-hardware list? -- i've got
> some issues with an 40G WD - yeah i know WD ,-)

There was a thread on reiserfs-list about write-caching on some IDE
drives. I think it was stated that WD did write-caching by default.
(and write-caching can make your filesystem inconsistent, and cause all
kinds of problems, if you happen to shutdown the machine at a bad time).

Check if write-caching is enabled with the hdparm command - turn it off
if it is. You should also run fsck to check if your filesystem is ok
(remember to back up first).

BTW: It isn't clear from your previous mail that this in fact a
filesystem problem. The output from fsck may or may not confirm that it
is. You could also strace your mpg123 process, to see exactly what it
tries to do and how it failes. You should also check /var/log/messages
for errors.


-- 
Ragnar Kjorstad
Big Storage
