Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1JGSVi15006
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 11:28:31 -0500
Received: from mail.osdl.org (fw.osdl.org [65.172.181.6])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1JGSVb23470
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 11:28:31 -0500
Received: from osdl.org (markw@ibm-b.pdx.osdl.net [172.20.1.51])
	by mail.osdl.org (8.11.6/8.11.6) with ESMTP id i1JGSME07107
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 08:28:23 -0800
Message-Id: <200402191628.i1JGSME07107@mail.osdl.org>
From: markw@osdl.org
Subject: Re: [linux-lvm] file corruption writing to lvm2 volume
In-Reply-To: <200402190012.i1J0CmE14998@mail.osdl.org>
MIME-Version: 1.0
Content-Type: MULTIPART/mixed; BOUNDARY="8323328-1804289383-1077208104=:23483"
Content-Transfer-Encoding: BINARY
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Feb 19 11:27:03 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--8323328-1804289383-1077208104=:23483
Content-Type: TEXT/plain; charset=us-ascii

On 18 Feb, To: linux-lvm@redhat.com wrote:
> I have a program that's writing data out to a file and it looks like my
> files are not written out correctly onto an lvm2 volume, while they will
> write out correctly to a non lvm2 partition.
> 
> I'm not seeing any errors on the console, so I'm not sure what to look
> for.  Let me know what kind of data I can provide.
> 
> I'm running linux-2.6.2 on ia64.

The attached program can be used to expose the problem.

Mark 

--8323328-1804289383-1077208104=:23483
Content-Type: TEXT/plain; name="floop.c"
Content-Disposition: attachment; filename="floop.c"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <getopt.h>

int main(int argc, char *argv[])
{
	int c;
	char filename[1024];
	FILE *outfile;
	int i, j, k;
	int factor;

	if (argc < 4) {
		printf("usage: %s -o <dir> -c #\n", argv[0]);
		return 1;
	}

	while (1) {
		int option_index = 0;
		static struct option long_options[] = {
			{ 0, 0, 0, 0 }
		};

		c = getopt_long(argc, argv, "c:o:",
			long_options, &option_index);
		if (c == -1) {
			break;
		}

		switch (c) {
		case 0:
			break;
		case 'c':
			factor = atoi(optarg);
			break;
		case 'o':
			strcpy(filename, optarg);
			break;
		defaults:
			return 2;
		}
	}

	strcat(filename, "/file.out");
	outfile = fopen(filename, "w");
	if (outfile == NULL) {
		printf("cannot open %s\n", filename);
		return 3;
	}

	for (i = 0; i < factor; i++) {
		for (j = 0; j < 10; j++) {
			for (k = 0; k < 3000; k++) {
				fprintf(outfile, "%d %d %d\n", i, j, k);
			}
		}
	}
	fclose(outfile);
		
	return 0;
}

--8323328-1804289383-1077208104=:23483--
