Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 2 May 2001 08:35:11 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm on alpha/sparc
Message-ID: <20010502083511.B638@tykepenguin.com>
References: <20010502012851.A4517@ikar.t17.ds.pwr.wroc.pl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010502012851.A4517@ikar.t17.ds.pwr.wroc.pl>; from misiek@pld.ORG.PL on Wed, May 02, 2001 at 01:28:51AM +0200
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
To: linux-lvm@sistina.com

On Wed, May 02, 2001 at 01:28:51AM +0200, Arkadiusz Miskiewicz wrote:
> 
> but on sparc there is problem with linux/string.h which is breaking compilation ;-(
> Workaround - avoid inclusion of linux/string.h:

Hmmm funny that. There was an ifdef __sparc__ in there originally which I
removed because it broke the ultraSPARC compilation. Then I wen to compile for
my 32bit SPARCstartion IPC and it was needed again :-(

Just for reference - what kind of SPARC system is it you are using ?

patrick
